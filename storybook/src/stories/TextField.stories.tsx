import { Meta, StoryObj } from "@storybook/react";
import { TextField } from "./TextField";

const meta = {
  title: "Widgets/TextField",
  component: TextField,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof TextField>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
