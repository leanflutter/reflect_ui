import { Meta, StoryObj } from "@storybook/react";
import { Alert } from "./Alert";

const meta = {
  title: "Widgets/Alert",
  component: Alert,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    label: { control: { type: "text" } },
  },
} satisfies Meta<typeof Alert>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};

export const With_Variant: Story = {
  args: {},
};
