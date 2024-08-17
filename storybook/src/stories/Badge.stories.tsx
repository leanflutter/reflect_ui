import { Meta, StoryObj } from "@storybook/react";
import { Badge } from "./Badge";

const meta = {
  title: "Widgets/Badge",
  component: Badge,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof Badge>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
